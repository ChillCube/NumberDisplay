# NumberDisplay API Reference
Generated: 2026-05-20

A way to display numbers based on custom sprites on the screen in Godot

## Class: NumbersUI2D
**Inherits:** [NodeArranger](git@github.com:ChillCube/2d_node_arranger/blob/main/DOCUMENTATION.md)


### ⚙️ Inspector Variables (Exported)
| Property | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| **number** | `int:` | `-` | The non-negative integer to display; rebuilds digit nodes on change |
| **number_resource** | `NumberResource` | `-` | Maps digit values to Texture2D assets; required for rendering |
| **h_alignment** | `HAlignment` | `HAlignment.LEFT` | Horizontal alignment of the digit row relative to this node's position |
| **spawn_offset** | `Vector2` | `Vector2.ZERO` | Initial position offset applied to newly created digit nodes (useful for pop-in effects) |

### 🛠️ Methods
| Method | Arguments | Returns | Description |
| :--- | :--- | :--- | :--- |
| **get_digit()** | `number: int`<br>`position: int` | `int` |  Extracts the digit at `position` (0 = ones, 1 = tens, etc.) from `number` |
| **get_number_length()** | `number: int` | `int` |  Returns the number of digits in the decimal representation of `number` |
| **set_number()** | `val : int` | `void` |  Rebuilds the digit node children to match `val`, creating or removing DigitNumbers as needed |

---

